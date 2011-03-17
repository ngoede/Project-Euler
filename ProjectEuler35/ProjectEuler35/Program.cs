using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace ProjectEuler35 {
	class Program {
		static void Main(string[] args) {
			var primes = GeneratePrimes(1000000);
			var counter = TestPrimes(primes);
			Console.WriteLine(counter);
		}

		private static int TestPrimes(HashSet<int> primes) {
			var counter = 0;
			foreach (int i in primes) {
				if (Rotations(i).All(primes.Contains)) counter++;
			}
			return counter;
		}

		static IEnumerable<int> Rotations(int i) {
			var result = new List<int>();
			var int_string = i.ToString();
			var rotatedString = int_string.Substring(1) + int_string.Substring(0, 1);
			var rotation = int.Parse(rotatedString);
			while (rotation != i) {
				result.Add(rotation);
				rotatedString = rotatedString.Substring(1) + rotatedString.Substring(0, 1);
				rotation = int.Parse(rotatedString);
			}
			return result;
		}

		static HashSet<int> GeneratePrimes(int maxNumber) {
			var p = 2;
			var numbers = Enumerable.Range(2, maxNumber - 1).ToList();
			int counter = 0;
			var result = new HashSet<int>();
			while (p * p <= maxNumber) {
				result.Add(p);
				numbers = numbers.Where(n => n % p != 0).ToList();
				p = numbers.First();
			}
			numbers.ForEach(n => result.Add(n));
			return result;
		}
	}
}
