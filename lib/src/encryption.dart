part of '../tg.dart';

Future<InputCheckPasswordSRP> check2FA(
    AccountPassword accountPassword, Future<String> Function() getPassword) {
  final currentAlgo = accountPassword.currentAlgo
      as PasswordKdfAlgoSHA256SHA256PBKDF2HMACSHA512iter100000SHA256ModPow;

  final algo = accountPassword.newAlgo
      as PasswordKdfAlgoSHA256SHA256PBKDF2HMACSHA512iter100000SHA256ModPow;

/*            if (accountPassword.current_algo is not PasswordKdfAlgoSHA256SHA256PBKDF2HMACSHA512iter100000SHA256ModPow algo)
                if (accountPassword.current_algo == null && (algo = accountPassword.new_algo as PasswordKdfAlgoSHA256SHA256PBKDF2HMACSHA512iter100000SHA256ModPow) != null)
                {
                    int salt1len = algo.salt1.Length;
                    Array.Resize(ref algo.salt1, salt1len + 32);
                    RNG.GetBytes(algo.salt1, salt1len, 32);
                }
                else
                    throw new WTException("2FA authentication uses an unsupported algo: " + accountPassword.current_algo?.GetType().Name);

            var g = new BigInteger(algo.g);
            var p = BigEndianInteger(algo.p);
            var validTask = Task.Run(() => CheckGoodPrime(p, algo.g));

            System.Threading.Thread.Sleep(100);
            Helpers.Log(3, $"This account has enabled 2FA. A password is needed. {accountPassword.hint}");
            var passwordBytes = Encoding.UTF8.GetBytes(await getPassword());

            using var sha256 = SHA256.Create();
            sha256.TransformBlock(algo.salt1, 0, algo.salt1.Length, null, 0);
            sha256.TransformBlock(passwordBytes, 0, passwordBytes.Length, null, 0);
            sha256.TransformFinalBlock(algo.salt1, 0, algo.salt1.Length);
            var hash = sha256.Hash;
            sha256.Initialize();
            sha256.TransformBlock(algo.salt2, 0, algo.salt2.Length, null, 0);
            sha256.TransformBlock(hash, 0, 32, null, 0);
            sha256.TransformFinalBlock(algo.salt2, 0, algo.salt2.Length);
            hash = sha256.Hash;
#if NETCOREAPP2_0_OR_GREATER
            using var derive = new Rfc2898DeriveBytes(hash, algo.salt1, 100000, HashAlgorithmName.SHA512);
            var pbkdf2 = derive.GetBytes(64);
#else
            var pbkdf2 = PBKDF2_SHA512(hash, algo.salt1, 100000, 64);
#endif
            sha256.Initialize();
            sha256.TransformBlock(algo.salt2, 0, algo.salt2.Length, null, 0);
            sha256.TransformBlock(pbkdf2, 0, 64, null, 0);
            sha256.TransformFinalBlock(algo.salt2, 0, algo.salt2.Length);
            var x = BigEndianInteger(sha256.Hash);

            var v = BigInteger.ModPow(g, x, p);
            if (accountPassword.current_algo == null) // we're computing a new password
            {
                await validTask;
                return new InputCheckPasswordSRP { A = v.To256Bytes() };
            }

            var g_b = BigEndianInteger(accountPassword.srp_B);
            var g_b_256 = g_b.To256Bytes();
            var g_256 = g.To256Bytes();

            sha256.Initialize();
            sha256.TransformBlock(algo.p, 0, 256, null, 0);
            sha256.TransformFinalBlock(g_256, 0, 256);
            var k = BigEndianInteger(sha256.Hash);

            var k_v = (k * v) % p;
            var a = BigEndianInteger(new Int256(RNG).raw);
            var g_a = BigInteger.ModPow(g, a, p);
            var g_a_256 = g_a.To256Bytes();

            sha256.Initialize();
            sha256.TransformBlock(g_a_256, 0, 256, null, 0);
            sha256.TransformFinalBlock(g_b_256, 0, 256);
            var u = BigEndianInteger(sha256.Hash);

            var t = (g_b - k_v) % p; //(positive modulo, if the result is negative increment by p)
            if (t.Sign < 0) t += p;
            var s_a = BigInteger.ModPow(t, a + u * x, p);
            sha256.Initialize();
            var k_a = sha256.ComputeHash(s_a.To256Bytes());

            hash = sha256.ComputeHash(algo.p);
            var h2 = sha256.ComputeHash(g_256);
            for (int i = 0; i < 32; i++) hash[i] ^= h2[i];
            var hs1 = sha256.ComputeHash(algo.salt1);
            var hs2 = sha256.ComputeHash(algo.salt2);
            sha256.Initialize();
            sha256.TransformBlock(hash, 0, 32, null, 0);
            sha256.TransformBlock(hs1, 0, 32, null, 0);
            sha256.TransformBlock(hs2, 0, 32, null, 0);
            sha256.TransformBlock(g_a_256, 0, 256, null, 0);
            sha256.TransformBlock(g_b_256, 0, 256, null, 0);
            sha256.TransformFinalBlock(k_a, 0, 32);
            var m1 = sha256.Hash;

            await validTask;
            return new InputCheckPasswordSRP { A = g_a_256, M1 = m1, srp_id = accountPassword.srp_id };
 */

  throw UnimplementedError();
}
