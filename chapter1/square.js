function squareIter(guess, x) {
    console.log({
        'x': x,
        'guess': guess,
        'quotient': x/guess,
        'diff': Math.abs((x - guess*guess))
    });
    if (goodEnough(guess, x)) {
        return guess;
    } else {
        return squareIter(improve(guess, x), x);
    }
}

function goodEnough(guess, x) {
    diff = Math.abs((x - guess*guess));
    if (diff > 0.0001) {
        return false;
    } else {
        return true;
    }
}

function improve(guess, x) {
    improved = ((x/guess)+guess)/2;
    return improved;
}

x = 0.0000000001
console.log(squareIter(1, x));
console.log(Math.sqrt(x));
