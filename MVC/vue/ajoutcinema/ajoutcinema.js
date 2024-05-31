const checkboxIndoor = document.getElementById('Indoor');
const checkboxOutdoor = document.getElementById('Outdoor');
const salleCinema = document.getElementById('salleCinema');

checkboxIndoor.addEventListener('change', function(){
  if (this.checked) {
    salleCinema.style.display = 'block';
  } else {
    salleCinema.style.display = 'none';
  }
});

checkboxOutdoor.addEventListener('change', function(){
  if (this.checked) {
    salleCinema.style.display = 'none';
  }
});
