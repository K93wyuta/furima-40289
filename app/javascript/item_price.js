const autofill = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
    const fee = Math.floor(inputValue*0.1);
    const profit = (inputValue - fee);
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfit = document.getElementById("profit");
    addTaxDom.innerHTML = `${fee}`;
    addProfit.innerHTML = `${profit}`;
  });
};

window.addEventListener("turbo:load", autofill);