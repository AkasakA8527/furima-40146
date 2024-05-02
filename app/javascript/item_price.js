document.addEventListener('turbo:load', function() {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {

    const inputValue = priceInput.value;

    let addTaxValue = Math.floor(inputValue * 0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = addTaxValue;

    let profitValue = Math.floor(inputValue - addTaxValue);
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = profitValue;

  });

});