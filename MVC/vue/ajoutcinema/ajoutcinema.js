const checkboxIndoor = document.getElementById('Indoor');
const checkboxOutdoor = document.getElementById('Outdoor');
const salleCinema = document.getElementById('salleCinema');

checkboxIndoor.addEventListener('change', function(){
  if (this.checked) {
    salleCinema.style.display = 'block';
    checkboxOutdoor.disabled = true;
  } else {
    salleCinema.style.display = 'none';
    checkboxOutdoor.disabled = false;
  }
});

checkboxOutdoor.addEventListener('change', function(){
  if (this.checked) {
    salleCinema.style.display = 'none';
    checkboxIndoor.disabled = true;
  } else {
    checkboxIndoor.disabled = false;
  }
});

function ajoutimg(e) {
  const file = e.target.files[0];
  const reader = new FileReader();
  reader.onloadend = function () {
      document.querySelector('.image-container img').src = reader.result;
      document.getElementById('imageChoisi').style.display = 'none'; // cache l'input
      document.querySelector('.image-container').style.display = 'flex'; // affiche l'image
      document.getElementById('delete-img').style.display = 'block'; // affiche le bouton de suppression
  }
  if (file) {
      reader.readAsDataURL(file);
  } else {
      document.querySelector('.image-container img').src = "";
      document.getElementById('imageChoisi').style.display = 'block'; // affiche l'input
      document.querySelector('.image-container img').style.display = 'none'; // cache l'image
  }

  console.log(reader.result);
};

function deleteimg() {
  document.querySelector('.image-container img').src = "";
  document.getElementById('imageChoisi').value = ""; // reset l'input
  document.getElementById('imageChoisi').style.display = 'block'; // affiche l'input
  document.querySelector('.image-container').style.display = 'none'; // cache l'image
  document.getElementById('delete-img').style.display = 'none'; // cache le bouton de suppression
}