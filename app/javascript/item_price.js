function calculator () {
  const getPrice = document.getElementById("item-price");
  getPrice.addEventListener("input", () => {
    const getValue = getPrice.value;
    const getAddTax = document.getElementById("add-tax-price")
    const addTaxPrice = Math.floor(getValue * 0.1)
    getAddTax.innerHTML = addTaxPrice
    const getSalesProfit = document.getElementById("profit")
    getSalesProfit.innerHTML = getValue - addTaxPrice
  })
}

window.addEventListener('load', calculator)