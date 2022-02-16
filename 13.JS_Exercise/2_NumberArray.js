// Create a function that takes an array of strings and returns an array with only the strings that have numbers in them. If there are no strings containing numbers, return an empty array.

function findNumericStringsFromArray1(arr) {
  pattern = ".*[0-9].*"; // regex pattern to check if at least one number is present in string
  sol = [];
  arr.forEach((element) => {
    if (element.match(pattern)) {
      sol.push(element);
    }
  });
  return sol;
}

function findNumericStringsFromArray2(arr) {
  // We can also use the unary plus operator to convert a whole string into a number.
  // returns true if convertible else NaN
  sol = [];
  arr.forEach((element) => {
    if (+element) {
      sol.push(element);
    }
  });
  return sol;
}

let test = [
  "sahil",
  "kavitake",
  "123",
  "43.5",
  "-0.00002",
  "sah123",
  "12Sahil",
  "sa12.45hil",
];

// includes at least one number in element of array of strings
console.log(findNumericStringsFromArray1(test)); // [ '123', '43.5', '-0.00002', 'sah123', '12Sahil', 'sa12.45hil' ]

// array of strings that are numbers in them
console.log(findNumericStringsFromArray2(test)); // [ '123', '43.5', '-0.00002' ]
