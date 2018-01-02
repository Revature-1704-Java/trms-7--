//Employee info json
let employee;

function login(email) {
    let xmlhttp = new XMLHttpRequest();
    let url = "http://127.0.0.1:8081/TRMSServlet/Login?email=" + email;

    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var json = JSON.parse(this.responseText);
            if (json.employeeId == 0) {
                document
                    .getElementById("login_greeting")
                    .innerHTML = json.firstName;
            } else {
                console.log(json);
                employee=json;
                //Great user on login
                document
                    .getElementById("login_greeting")
                    .innerHTML = "Welcome " + json.firstName + " " + json.lastName + "!";
                //Show create_new_education_request button
                document
                    .getElementById("new_education_request_btn")
                    .hidden = false;
                //TODO Show open education requests this user can approve
            }
        }
    };
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
function create_new_education_request() {
    console.log(employee);
    document
        .getElementById("new_education_request")
        .hidden = false;
}

function submit_new_education_request(){
    var education_request = new Object();
    education_request.start_date = document.getElementById('start_date').value;
    education_request.end_date = document.getElementById('end_date').value;
    education_request.education_type_ddl = document.getElementById("education_type_ddl");
    education_request.education_type_value = education_type_ddl.options[education_type_ddl.selectedIndex].value;
    education_request.days_off = document.getElementById('days_off').value;
    education_request.cost = document.getElementById('cost').value;
    education_request.location = document.getElementById('location').value;
    education_request.justification = document.getElementById('justification').value;

    console.log(education_request.start_date);
    console.log(education_request.end_date);
    console.log(education_request.education_type_value);
    console.log(education_request.days_off);
    console.log(education_request.cost);
    console.log(education_request.location);
    console.log(education_request.justification);
}