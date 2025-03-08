//Get Transaction Type
const transactType = document.querySelector("#transact-type");

//Get Transaction Type
const paymentCard = document.querySelector(".payment-card");
const transferCard = document.querySelector(".transfer-card");
const depositCard = document.querySelector(".deposit-card");
const withdrawCard = document.querySelector(".withdrawal-card");

transactType.addEventListener("change", ()=>{

    //Get transact type and display form
    switch(transactType.value)
    {
        case "payment":
            paymentCard.style.display = "block";
            transferCard.style.display = "none";
            depositCard.style.display = "none";
            withdrawCard.style.display = "none";
        break;

        case "transfer":
            transferCard.style.display = "block";
            paymentCard.style.display = "none";
            depositCard.style.display = "none";
            withdrawCard.style.display = "none";
        break;

        case "deposit":
            depositCard.style.display = "block";
            paymentCard.style.display = "none";
            transferCard.style.display = "none";
            withdrawCard.style.display = "none";

        break;

        case "withdraw":
            withdrawCard.style.display = "block";
            paymentCard.style.display = "none";
            transferCard.style.display = "none";
            depositCard.style.display = "none";
        break;

    }
});