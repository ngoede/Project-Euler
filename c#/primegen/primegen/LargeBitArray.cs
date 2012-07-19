using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace primegen {
	public class LargeBitArray : IEnumerable<bool> {
		readonly long maxIndex;
		const int MAX_ARRAY_SIZE = 100000000;

		private readonly BitArray[] backingStore;

		public LargeBitArray(long arraySize) {
			maxIndex = arraySize - 1;
			var toCreate = ArraysToCreate(arraySize);
			backingStore = new BitArray[toCreate.Count()];
			for (var i = 0; i < toCreate.Count(); i++) {
				backingStore[i] = new BitArray(toCreate[i]);
			}
		}

		static List<int> ArraysToCreate(long arraySize) {
			var numberOfWholeArrays = (int)(arraySize / MAX_ARRAY_SIZE);
			var arraysToCreate = Enumerable.Repeat(MAX_ARRAY_SIZE, numberOfWholeArrays).ToList();
			if (arraySize % MAX_ARRAY_SIZE != 0) arraysToCreate.Add((int)(arraySize % MAX_ARRAY_SIZE));
			return arraysToCreate;
		}

		public bool this[long index] {
			get { return backingStore[index / MAX_ARRAY_SIZE][(int)(index % MAX_ARRAY_SIZE)]; }
			set { backingStore[index / MAX_ARRAY_SIZE][(int)index % MAX_ARRAY_SIZE] = value; }
		}

		public IEnumerator<bool> GetEnumerator() {
			var currentIndex = 0l;
			while(currentIndex <= maxIndex) {
				yield return this[currentIndex];
				currentIndex += 1;
			}
		}

		IEnumerator IEnumerable.GetEnumerator() {
			return GetEnumerator();
		}
	}
}
