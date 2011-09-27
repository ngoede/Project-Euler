using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectEuler34 {
	class Program {
		static int[] factorials = new int[10];

		static void Main(string[] args) {
			
			foreach (int i in Enumerable.Range(0, 10)) {
				factorials[i] = Factorial(i);
			}
			var sum = 0;
			foreach (int i in Enumerable.Range(143, 9999999 - 143)) {
				if (i == SumOfFactorials(NumberToDigits(i))) {
					sum += i;
				}
			}
			Console.WriteLine(sum);
		}

		static int SumOfFactorials(IEnumerable<int> digits) {
			int sum = 0;
			foreach(int i in digits) sum += factorials[i];
			return sum;
		}

		static int[] NumberToDigits(int i) {
			var stringOfI = i.ToString();
			var result = new int[stringOfI.Length];
			var x = 0;
			foreach (char c in stringOfI) result[x++] = digits[c];
			return result;
		}

		static Dictionary<char, int> digits = new Dictionary<char, int> {
			{'0', 0},
			{'1', 1},
			{'2', 2},
			{'3', 3},
			{'4', 4},
			{'5', 5},
			{'6', 6},
			{'7', 7},
			{'8', 8},
			{'9', 9},
		};

		public static int Factorial(int i) {
			if (i == 0) return 1;
			if (i == 1 || i == 2) return i;
			return i * Factorial(i - 1);
		}
	}
}
