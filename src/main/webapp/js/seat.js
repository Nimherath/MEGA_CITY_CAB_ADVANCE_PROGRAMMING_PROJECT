let seats = document.querySelector(".all-seats");

// Generate 59 seats dynamically
for (let i = 0; i < 59; i++) {
    let randint = Math.floor(Math.random() * 2);
    let booked = randint === 1 ? "booked" : "";

    seats.insertAdjacentHTML(
        "beforeend",
        `<input type="checkbox" name="tickets" id="s${i + 2}" ${booked ? "disabled" : ""}/>
        <label for="s${i + 2}" class="seat ${booked}"></label>`
    );
}

// Add event listeners to update ticket info
let tickets = seats.querySelectorAll("input:not(:disabled)");
tickets.forEach((ticket) => {
    ticket.addEventListener("change", () => {
        let amountElement = document.querySelector(".amount");
        let countElement = document.querySelector(".count");

        let amount = Number(amountElement.innerHTML);
        let count = Number(countElement.innerHTML);

        if (ticket.checked) {
            count += 1;
            amount += 200; // Price per ticket
        } else {
            count -= 1;
            amount -= 200;
        }

        // Update the UI with the new values
        amountElement.innerHTML = amount;
        countElement.innerHTML = count;
    });
});