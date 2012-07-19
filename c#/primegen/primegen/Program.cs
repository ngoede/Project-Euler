using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace primegen {
	class Program {
		static void Main(string[] args) {
			var array = new LargeBitArray(10000000000l);
			Console.WriteLine(array.LongCount());
			Console.ReadLine();
		}
	}
}
