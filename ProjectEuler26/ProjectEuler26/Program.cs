using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectEuler26 {
	class Program {
		static void Main(string[] args) {
			var maxNumberOfDigits = 0;
			var maxValue = 0;
			foreach (var i in Enumerable.Range(1, 1000)) {
				var num = new Division(i).Skip(1);
				var digits = new List<int>();
				foreach (var digit in num) {
					digits.Add(digit);
					if (IsCycle(digits)) {
						if (maxNumberOfDigits < digits.Count) {
							maxNumberOfDigits = digits.Count;
							maxValue = i;
						}
						break;
					}
					if (digits.Count > 100000) break;  //Saftey valve
				}
			}
			Console.WriteLine(maxValue);
			Console.WriteLine(maxNumberOfDigits);
			Console.WriteLine();
			Console.ReadLine();
		}

		private static bool IsCycle(List<int> digits) {
			if (digits.Count % 2 != 0) return false;
			for (var i = 0; i < digits.Count / 2; i++) {
				if (digits[i] != digits[digits.Count / 2 + i]) return false;
			}
			return true;
		}
	}

	public class Division : IEnumerable<int> {

		int currentDigit = 1;
		int denominator;

		public Division(int denominator) {
			this.denominator = denominator;
		}


		public IEnumerator<int> GetEnumerator() {
			while (currentDigit != 0) {
				var wholePart = currentDigit / denominator;
				var accountedFor = wholePart * denominator;
				var remainder = currentDigit - accountedFor;
				currentDigit = remainder * 10;
				yield return wholePart;
			}

		}

		System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator() {
			return this.GetEnumerator();
		}
	}
}
