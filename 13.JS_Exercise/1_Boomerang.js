// 1. A boomerang is a V-shaped sequence that is either upright or upside down. Specifically, a boomerang can be defined as: sub-array of length 3, with the first and last digits being the same and the middle digit being different.

// - [3, 7, 3], [1, -1, 1], [5, 6, 5]

// Create a function that returns the total number of boomerangs in an array.

// input: [3, 7, 3, 2, 1, 5, 1, 2, 2, -2, 2]

// output: 3 boomerangs in this sequence:  [3, 7, 3], [1, 5, 1], [2, -2, 2]

function countBoomerangs(arr) {
  let sol = 0;
  for (let i = 2; i < arr.length; i++) {
    if (arr[i] == arr[i - 2] && arr[i] !== arr[i - 1]) {
      sol++;
    }
  }
  return sol;
}

console.log(countBoomerangs([3, 7, 3, 2, 1, 5, 1, 2, 2, -2, 2])); // 3
console.log(countBoomerangs([9, 5, 9, 5, 1, 1, 1])); // 2
console.log(countBoomerangs([5, 6, 6, 7, 6, 3, 9])); // 1
console.log(countBoomerangs([4, 4, 4, 9, 9, 9, 9])); // 0
console.log(countBoomerangs([1, 7, 1, 7, 1, 7, 1])); // 5
