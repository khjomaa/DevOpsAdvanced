fetch("/creds/creds.txt")
    .then(response => response.text())
    .then(text => {
        document.getElementById("show-text").innerHTML = text;
    });