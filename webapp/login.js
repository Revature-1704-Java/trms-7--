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
                employee = json;
                //Great user on login
                document
                    .getElementById("login_greeting")
                    .innerHTML = "Welcome " + json.firstName + " " + json.lastName + "!";
                //Show create_new_education_request button
                document
                    .getElementById("new_education_request_btn")
                    .hidden = false;
                // TODO Show open education requests this user can approve Show the users
                // education requests
                show_my_education_requests(json.employeeId);
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

function submit_new_education_request() {
    let education_request = new Object();
    education_request.startDate = document
        .getElementById('start_date')
        .value;
    education_request.endDate = document
        .getElementById('end_date')
        .value;
    let education_type_ddl = document.getElementById("education_type_ddl");
    education_request.type = education_type_ddl.options[education_type_ddl.selectedIndex].value;
    education_request.daysOff = document
        .getElementById('days_off')
        .value;
    education_request.cost = document
        .getElementById('cost')
        .value;
    education_request.location = document
        .getElementById('location')
        .value;
    education_request.justification = document
        .getElementById('justification')
        .value;

    education_request.employeeId = employee.employeeId;

    console.log(education_request.employeeId);
    console.log(document.getElementById('start_date').value);
    console.log(education_request.starDate);
    console.log(education_request.endDate);
    console.log(education_request.type);
    console.log(education_request.daysOff);
    console.log(education_request.cost);
    console.log(education_request.location);
    console.log(education_request.justification);

    let json_education_request = JSON.stringify(education_request);

    let url = "http://127.0.0.1:8081/TRMSServlet/EducationRequest";
    let xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST", url);
    xmlhttp.setRequestHeader("Content-Type", "application/json");
    xmlhttp.send(json_education_request);
    setTimeout(function () {
        show_my_education_requests(employee.employeeId);
    }, 3000);
}

function show_my_education_requests(employeeId) {
    let xmlhttp = new XMLHttpRequest();
    let url = "http://localhost:8081/TRMSServlet/EducationRequest?employee_id=" + employeeId;

    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var json = JSON.parse(this.responseText);
            if (json == null) {} else {
                console.log(json);
                document
                    .getElementById("your_requests")
                    .hidden = false;

                let t = {
                    '<>': 'div',
                    'html': 'Employee ID: ${employeeId}, Request ID: ${educationRequestId}, Cost: ${cost}, St' +
                            'art Date: ${startDate}, End Date: ${endDate}, Days Off: ${daysOff}, Location: ${loca' +
                            'tion}, Justification: ${justification}, Type ${type} </br>'+
                            'Supervisor Approval: ${supervisorApproval}, Dept Head Approval: ${departmentHeadApproval}, Benefit Coordinator Approval: ${benefitCoodinatorApproval}'
                };
                document
                    .getElementById("requests")
                    .innerHTML = json2html.transform(json, t);
            }
        }
    };
    xmlhttp.open("GET", url, true);
    xmlhttp.send();

}