let payjp;

const setupPayment = () => {
  const publicKey = gon.public_key;

  if (!payjp) {
    payjp = Payjp(publicKey);
  }

  const elements = payjp.elements();
  const numberElement = elements.create("cardNumber");
  const expiryElement = elements.create("cardExpiry");
  const cvcElement = elements.create("cardCvc");

  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");

  const form = document.getElementById("charge-form");

  const handleTokenCreation = (response) => {
    if (response.error) {
      // Handle error if needed
    } else {
      const token = response.id;
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value="${token}" name='token' type="hidden">`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
    }

    numberElement.clear();
    expiryElement.clear();
    cvcElement.clear();
    form.submit();
  };

  form.addEventListener("submit", (e) => {
    payjp.createToken(numberElement).then(handleTokenCreation);
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", setupPayment);