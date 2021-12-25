function is_prime(x) {
    let d = 2;
    const limit = Math.sqrt(x);
    while (d <= limit) {
        if (x % d === 0) {
            return false;
        }
        d +=1;
    }
    return true;
}

function create(class_name, value) {
    let result = document.createElement('div');
    result.className = class_name;
    result.innerText = value;
    return result;
}


document.addEventListener("DOMContentLoaded", () => {
    const inputForm = document.querySelector("#input-form");
    const resultBox = document.querySelector("#result");
    inputForm.addEventListener("submit", (evt) => {
        evt.preventDefault();
        resultBox.innerText = "";

        let n = document.getElementById("n-val").value;

        if (n % 1 === 0) {
            let res1 = " ";
            let i = Number(n);
            let l = i + 2;
            while (i <= 2*Number(n) - 2) {
                if (is_prime(i) && is_prime(l)) {
                    res1 = res1 + i + " " + l + ", ";
                }
                i += 1;
                l += 1;
            }
            if (res1 === " ") {
                res1 = "Нет пар-близнецов"
            }
           else {
                res1=res1.substring(0, res1.length - 2)
            }
            let HTML = create('table', '');
            let head_line = create('row', '');
            head_line.appendChild(create('cell', "Число n"));
            head_line.appendChild(create('cell', "Числа-близнецы"));
            let value_line = create('row', '');
            value_line.appendChild(create('cell', n));
            value_line.appendChild(create('cell', res1));
            HTML.appendChild(head_line);
            HTML.appendChild(value_line);
            let res = document.createElement('h1');
            res.innerText = 'Результат:'
            resultBox.append(res)
            resultBox.append(HTML)
        }
        else {
            alert("Вводите только целые числа!");
        }

        inputForm.reset();
    });
});
