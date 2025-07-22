function setupPriceCalculation() {
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
}

// Turboが読み込まれたとき（ページ遷移時）
document.addEventListener('turbo:load', setupPriceCalculation);

// renderされたとき（render :new などのリダイレクトなしの画面更新時）
document.addEventListener('turbo:render', setupPriceCalculation);
