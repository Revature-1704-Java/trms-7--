function login(email) {
    var xmlhttp = new XMLHttpRequest();
    var url = "http://127.0.0.1:8081/TRMSServlet/Login?email=" + email;
    console.log(email);
    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var json = JSON.parse(this.responseText);
            if (json.employeeId == 0) {
                
                document
                    .getElementById("login_greeting")
                    .innerHTML = json.firstName;
            } else {
                console.log(json);
                document
                    .getElementById("login_greeting")
                    .innerHTML = "Welcome " +json.firstName +" "+ json.lastName+"!";
            }
        }
    };
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
function create_new_education_request(){
    console.log('new edu');
}
function myFunction(arr) {
    var out = "";
    var i;
    for (i = 0; i < arr.length; i++) {
        out += '<a href="' + arr[i].url + '">' + arr[i].display + '</a><br>';
    }
    document
        .getElementById("id01")
        .innerHTML = out;
}

function handleIt() {
    alert("hello");
}