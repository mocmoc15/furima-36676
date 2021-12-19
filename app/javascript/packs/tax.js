window.addEventListener('load', () => {
  const inputPrice = document.getElementById("item-price");
    inputPrice.addEventListener("input", () => {
      const addTax = document.getElementById("add-tax-price");
      addTax.innerHTML = Math.floor(inputPrice.value * 0.1 );
      const addProfit = document.getElementById("profit");
      addProfit.innerHTML = Math.floor(inputPrice.value - Math.round(inputPrice.value * 0.1 ))
    })
});

