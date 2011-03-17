using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectEuler52 {
	class Program {
		static void Main(string[] args) {
			var start = DateTime.Now;
			int i = 142858;
			while (true) {
				var iHash = CreateHash(i);
				if (Multiples(i).All(n => CreateHash(n) == iHash)) break;
				i++;
			}
			Console.WriteLine(i);
			Console.WriteLine((DateTime.Now - start).TotalSeconds);
		}

		static int[] hashValues = {2,3,5,7,11,13,17,19,23,29};


		static IEnumerable<int> Multiples(int i) {
			return Enumerable.Range(2, 5).Select(n => n * i);
		}

		static int CreateHash(int i) {
			return i.ToString().Aggregate(1, (result, x) => hashValues[int.Parse(x.ToString())] * result);
		}
	}
}
