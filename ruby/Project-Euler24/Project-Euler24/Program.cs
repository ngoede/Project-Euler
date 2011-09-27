using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Project_Euler24 {
	class Program {
		static void Main(string[] args) {
			var resultList = Enumerable.Range(123456789, 1999999999).AsParallel().Where(HasExactlyOneOfEachDigit).ToList();
			if(resultList.Count < 1000000) throw new Exception();

			var result = resultList.OrderBy(n => n).Take(1000000).Last();
			Console.WriteLine(result);
			Console.ReadLine();

		}

		static bool HasExactlyOneOfEachDigit(int n) {
			var stringOfN = n.ToString();
			if (stringOfN.Length != 10 && (stringOfN.Contains('0') || stringOfN.Length != 9)) {  //If the permutation starts with 0 it will be a 9 digit number
				return false;
			}
			else {
				return stringOfN.ContainsExactlyOneOf('1') &&
					   stringOfN.ContainsExactlyOneOf('2') &&
					   stringOfN.ContainsExactlyOneOf('3') &&
					   stringOfN.ContainsExactlyOneOf('4') &&
					   stringOfN.ContainsExactlyOneOf('5') &&
					   stringOfN.ContainsExactlyOneOf('6') &&
					   stringOfN.ContainsExactlyOneOf('7') &&
					   stringOfN.ContainsExactlyOneOf('8') &&
					   stringOfN.ContainsExactlyOneOf('9') &&
					   stringOfN.ContainsOneOrZeroOf('0');
			}
		}
	}

	public static class StringExtensions {
		public static bool ContainsExactlyOneOf(this string s, char c) {
			return s.Count(a => a == c) == 1;
		}

		public static bool ContainsOneOrZeroOf(this string s, char c) {
			return s.Count(a => a == c) <= 1;
		}
	}
}
