
//AJAX
let xhr = new XMLHttpRequest();

xhr.onreadystatechange = function() {
  if (this.readyState == 4 & this.status == 200)
    console.log ("success!");
}

//OR xhr.onsuccess
//OR xhr.onerror

xhr.open('get', 'http://localhost:8081/TRMSServlet/Login');

xhr.send();