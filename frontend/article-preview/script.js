const share = document.querySelector("[data-share]");
const shareButton = document.querySelector(".share__button");

function setShareOpen(isOpen) {
  share.classList.toggle("is-active", isOpen);
  shareButton.setAttribute("aria-expanded", String(isOpen));
}

shareButton.addEventListener("click", () => {
  setShareOpen(!share.classList.contains("is-active"));
});

document.addEventListener("click", (event) => {
  if (!share.contains(event.target)) {
    setShareOpen(false);
  }
});

document.addEventListener("keydown", (event) => {
  if (event.key === "Escape") {
    setShareOpen(false);
    shareButton.focus();
  }
});
