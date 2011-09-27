using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectEuler17 {
	class Program {
		static void Main(string[] args) {
			Console.WriteLine(ToWords(342));
			Console.WriteLine(ToWords(342).Length);
			Console.WriteLine(ToWords(115));
			Console.WriteLine(ToWords(10));
			Console.WriteLine(ToWords(100));
			Console.WriteLine(ToWords(115).Length);
			Console.WriteLine(Enumerable.Range(1, 1000).Sum(i => ToWords(i).Length));

		}

		static string[] words = new string[] {
			"",
			"one",
			"two",
			"three",
			"four",
			"five",
			"six",
			"seven",
			"eight",
			"nine"
		};

		static string[] teens = new string[] {
			"ten",
			"eleven",
			"twelve",
			"thirteen",
			"fourteen",
			"fifteen",
			"sixteen",
			"seventeen",
			"eighteen",
			"nineteen"
		};

		static string[] tens = new string[] {
			"",
			"",
			"twenty",
			"thirty",
			"forty",
			"fifty",
			"sixty",
			"seventy",
			"eighty",
			"ninety"
		};

		static string TwoDigits(int tensDigit, int onesDigit) {
			if (tensDigit == 1) return teens[onesDigit];
			return tens[tensDigit] + words[onesDigit];
		}

		static string ToWords(int i) {
			if (i == 1000) return "onethousand";

			var digits = i.ToString().Select(c => int.Parse(c.ToString())).ToArray();
			if (digits.Length == 1) return words[digits[0]];
			if (digits.Length == 2) return TwoDigits(digits[0], digits[1]);
			if (digits.Length == 3) {
				var twoDigits = TwoDigits(digits[1], digits[2]);
				if(twoDigits != "") return words[digits[0]] + "hundredand" + twoDigits;
				return words[digits[0]] + "hundred";
			}
			throw new Exception("Ah snap");
		}
	}
}
