// 4. Create a function that takes one, two or more numbers as arguments and adds them together to get a new number. The function then repeatedly multiplies the digits of the new number by each other, yielding a new number, until the product is only 1 digit long. Return the final product.

function sum(x, y) {
  return x + y;
}

function product(x, y) {
  return x * y;
}

function addAllThenMultiply(...params) {
  let arr = new Array([...params])[0];

  // check if only one parameter is passed and is one digit
  if ((arr.length === 1) & (arr > -10 && arr < 10)) {
    return arr[0];
  }

  // do the addition of digits
  let result = arr.reduce((sum, current) => sum + current, 0);

  // do multiplication until you get 1 digit number
  while (true) {
    if ((result > -10) & (result < 10)) {
      return result;
    }
    arr = Array.from(String(result));
    if (String(result)[0] === "-") {
      arr.shift();
      arr[0] = "-" + arr[0];
    }

    result = arr.reduce((product, current) => product * +current, 1);
  }
}

console.log(addAllThenMultiply(1)); // 1
console.log(addAllThenMultiply(17)); // 7
console.log(addAllThenMultiply(1, 2, 3)); // 6
console.log(addAllThenMultiply(1, 2, 3, 4, 5)); // 15 => 5
console.log(addAllThenMultiply(5, 6, 7, 8, 9)); // 35 => 15 > 5
console.log(addAllThenMultiply(5, 6, 7, 8, 9, 10)); // 45= > 20 => 0
console.log(addAllThenMultiply(-31)); // -3
console.log(addAllThenMultiply(5, 6, 7, -20)); // -2
console.log(addAllThenMultiply(5, 6, 7, -200)); // -182 => -16 => -6
