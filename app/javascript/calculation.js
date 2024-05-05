window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
  const addTaxDom = document.getElementById("add-tax-price");
  const addPofitDom = document.getElementById("profit");
  addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
  addPofitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
 })
});