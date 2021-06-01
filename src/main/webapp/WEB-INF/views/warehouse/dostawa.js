const input = document.querySelector("#dodaj-produkt");
input.addEventListener("click", e=> {
    const table = document.querySelector("table");
    e.preventDefault();
    const newTr = document.createElement("tr");
    newTr.innerHTML = `
            <td><form:select path="product" items="${products}" itemLabel="fullName" itemValue="id" />
            <form:errors path="product"/></td>
            
            <td><form:input path="amount"/>
            <form:errors path="amount"/></td>
            `
    table.appendChild(newTr);
})

document.addEventListener('DOMContentLoaded', function() {





});

function clickMe(){
    const newTr = document.createElement("tr");
    newTr.innerHTML = `
            <td><form:select path="product" items="${products}" itemLabel="name" itemValue="id" />
            <form:errors path="product"/></td>
            
            <td><form:input path="amount"/>
            <form:errors path="amount"/></td>
            
            <td><form:select path="warehouse" items="${warehouses}" itemLabel="name" itemValue="id" />
            <form:errors path="warehouse"/></td>
            `
    table.appendChild(newTr);
}