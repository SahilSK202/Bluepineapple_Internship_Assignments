// 5. Given an array, write a function to calculate it's depth. Assume that a normal array has a depth of 1.

// example:
//                 depth([1, 2, 3, 4]) ➞ 1
//                 depth([1, [2, 3, 4]]) ➞ 2
//                 depth([1, [2, [3, 4]]]) ➞ 3
//                 depth([1, [2, [3, [4]]]]) ➞ 4

function getArrayDepth(arr) {
  return Array.isArray(arr) ? 1 + Math.max(...arr.map(getArrayDepth)) : 0;
}

console.log(getArrayDepth([1, 2, 3, 4])); // ➞ 1
console.log(getArrayDepth([1, [2, 3, 4]])); // ➞ 2
console.log(getArrayDepth([1, [2, [3, 4]]])); // ➞ 3
console.log(getArrayDepth([1, [2, [3, [4]]]])); // ➞ 4
