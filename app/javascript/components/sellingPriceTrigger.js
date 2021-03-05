const sellingPriceTrigger = () => {
  const trigger = document.getElementById("selling-price-trigger");
  if (trigger) {
    trigger.addEventListener('click', (e) => {
      const form = document.querySelector(".selling-price-form");
      form.classList.toggle("active");
      e.currentTarget.classList.toggle("active");
      fetchClotheUpdate(form);
    });
  }
}

const fetchClotheUpdate = (form) => {
  const submit = document.querySelector('.submit-selling-price');
  if (submit) {
    submit.addEventListener('click', (e) => {
      form.submit();
    })
  }
}

export { sellingPriceTrigger };
