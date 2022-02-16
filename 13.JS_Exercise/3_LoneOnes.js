// 3. Create a function which counts how many lone 1s appear in a given number. Lone means the number doesn't appear twice or more in a row.

// example: countLoneOnes(101) ➞ 2, countLoneOnes(1191) ➞ 1

function countLoneOnes(num) {
  let arr = Array.from(String(num));
  let count = 0;

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === "1" && arr[i - 1] !== "1" && arr[i + 1] !== "1") {
      count++;
    }
  }
  return count;
}

console.log(countLoneOnes(101)); // 2
console.log(countLoneOnes(1191)); // 1
console.log(countLoneOnes(12112)); // 2
console.log(countLoneOnes(12112196178)); // 3
console.log(countLoneOnes(1121121111)); // 0
