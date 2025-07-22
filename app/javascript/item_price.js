window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById('item-price');
  const taxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  priceInput.addEventListener('input', () => {
    const price = parseInt(priceInput.value);

    const tax = Math.floor(price * 0.1); // 販売手数料：10%
    const gain = price - tax;            // 利益

    taxPrice.innerText = tax.toLocaleString();
    profit.innerText = gain.toLocaleString();
  });
});
