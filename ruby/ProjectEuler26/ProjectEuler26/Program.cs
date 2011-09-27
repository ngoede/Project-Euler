using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectEuler26 {
    class Program {
        static void Main(string[] args) {
            var maxNumberOfDigits = 0;
            var maxValue = 0;
            var maxRange = new KeyValuePair<int, int>(0, 0);
            var maxDigits = new List<int>();
            foreach (var i in Enumerable.Range(56, 1)) {
                var num = new Division(i).Skip(1);
                var digits = num.Take(1000).ToList();
                var result = floyd(digits);
                if (maxNumberOfDigits < result.Value - result.Key) {
                    maxNumberOfDigits = result.Value - result.Key;
                    maxValue = i;
                    maxRange = result;
                    maxDigits = digits;
                }
            }
            Console.WriteLine(maxValue);
            Console.WriteLine(maxNumberOfDigits);
            foreach (var d in maxDigits.GetRange(maxRange.Key, maxNumberOfDigits)) Console.Write(d);
            Console.WriteLine();

            foreach (var d in maxDigits.GetRange(maxRange.Key + maxNumberOfDigits, maxNumberOfDigits)) Console.Write(d);
            Console.WriteLine();

            Console.WriteLine();
            Console.ReadLine();
        }

        private static KeyValuePair<int, int> floyd(List<int> digits) {
            var tortoise = 1;
            var hare = 2;
            while (digits[hare] != digits[tortoise]) {
                tortoise++;
                hare += 2;
            }
            var mu = 0;
            hare = tortoise;
            tortoise = 0;
            while (digits[hare] != digits[tortoise]) {
                tortoise++;
                hare++;
                mu++;
            }

            var lam = 1;
            hare = tortoise + 1;
            while (digits[hare] != digits[tortoise]) {
                hare++;
                lam++;
            }
            return new KeyValuePair<int, int>(mu, lam);
        }
    }

    public class Division : IEnumerable<int> {

        int currentDigit = 1;
        int denominator;

        public Division(int denominator) {
            this.denominator = denominator;
        }


        public IEnumerator<int> GetEnumerator() {
            while (true) {
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
