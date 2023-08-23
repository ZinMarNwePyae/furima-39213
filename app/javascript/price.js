window.addEventListener('load', () => {
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTax = document.getElementById("add-tax-price");
    const Profit = document .getElementById("profit");
    addTax.innerHTML = Math.floor(inputValue * 0.1);
    Profit.innerHTML = inputValue - addTax.innerHTML;
    });
});

