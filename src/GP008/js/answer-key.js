var hiddenBoxes = document.getElementsByClassName("hidden-box");

const filePath = window.location.pathname;

const directoryName = filePath.substring(0, filePath.lastIndexOf('/'));

let language;
if (directoryName.includes("_eng")) {
  language = "EN";
} else if (directoryName.includes("_sv")) {
  language = "SV";
} else {
  language = "FI";
}
  
for (var i = 0; i < hiddenBoxes.length; i++) {
    hiddenBoxes[i].id = "hidden-box-" + (i + 1);
}

const codeBoxes = document.querySelectorAll('.code-box, .commandline-box');

codeBoxes.forEach(box => {
  const copyButton = document.createElement('button');
  copyButton.className = 'copy-button';

  copyButton.addEventListener('click', () => {
    const text = box.innerText.trim();

    navigator.clipboard.writeText(text)
      .then(() => {
        copyButton.classList.add('show-checkmark');
        setTimeout(() => {
          copyButton.classList.remove('show-checkmark');
        }, 1000);
      })
      .catch(err => {
        console.error('Failed to copy text:', err);
      });
  });

  box.appendChild(copyButton);
});

let show;
let hide;

switch (language) {
  case "EN":
    show = "Show ";
    hide = "Hide ";
    break;
  case "SV":
    show = "Visa ";
    hide = "Dölj ";
    break;
  default:
    show = "Näytä ";
    hide = "Piilota ";
}

const answerButtons = [...document.getElementsByClassName('answer_btn')];
answerButtons.forEach(button => {
  button.textContent = show + button.textContent;
});

function toggleAnswer(button) {  
    let buttons = document.getElementsByClassName('answer_btn');
    let buttonIndex = Array.from(buttons).indexOf(button) + 1;
  
    let buttonTextInput = button.textContent;
    let words = buttonTextInput.split(" ");
    let originalButtonText = words.slice(1).join(' ');
  
    let boxId = "hidden-box-" + buttonIndex;
    let hiddenBox = document.getElementById(boxId);
  
    if (hiddenBox) {
      let currentDisplay = window.getComputedStyle(hiddenBox).getPropertyValue("display");
      if (currentDisplay === "none") {
        hiddenBox.style.display = "block";
        button.textContent = hide + originalButtonText;
      } else {
        hiddenBox.style.display = "none";
        button.textContent = show + originalButtonText;
      }
    }
    else {
      button.textContent = "ERROR: Could not find hidden-box";
    }
}