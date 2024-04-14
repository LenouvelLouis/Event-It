statseance.tpl.querySelector('.sonore1').addEventListener('click', function() {
    statseance.tpl.getElementById('sonore_capt1').style.display = 'block';
    statseance.tpl.getElementById('sonore_capt2').style.display = 'none';
    statseance.tpl.getElementById('sonore_capt3').style.display = 'none';
});

statseance.tpl.querySelector('.sonore2').addEventListener('click', function() {
    statseance.tpl.getElementById('sonore_capt1').style.display = 'none';
    statseance.tpl.getElementById('sonore_capt2').style.display = 'block';
    statseance.tpl.getElementById('sonore_capt3').style.display = 'none';
});

statseance.tpl.querySelector('.sonore3').addEventListener('click', function() {
    statseance.tpl.getElementById('sonore_capt1').style.display = 'none';
    statseance.tpl.getElementById('sonore_capt2').style.display = 'none';
    statseance.tpl.getElementById('sonore_capt3').style.display = 'block';
});
