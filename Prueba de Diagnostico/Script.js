

document.addEventListener('DOMContentLoaded', function() {
    
    const form = document.getElementById('productForm');
    const materialCheckboxes = document.querySelectorAll('.material-checkbox');
    const materialError = document.getElementById('material-error');
    const bodegaSelect = document.getElementById('bodega');
    const sucursalSelect = document.getElementById('sucursal');
    const codigoInput = document.getElementById('codigo');
    const nombreInput = document.getElementById('nombre');
    const precioInput = document.getElementById('precio');
    const descripcionInput = document.getElementById('descripcion');
    const monedaSelect = document.getElementById('moneda');
    
    let codigosRegistrados = ['PROD01K', 'PROD02A']; // Simulación de base de datos

    // Cargar opciones de sucursal basadas en la bodega seleccionada
    bodegaSelect.addEventListener('change', function() {
        sucursalSelect.innerHTML = '<option value="">Seleccionar</option>';
        if (this.value === '1') {
            sucursalSelect.innerHTML += '<option value="1">Sucursal 1</option><option value="2">Sucursal 2</option>';
        } else if (this.value === '2') {
            sucursalSelect.innerHTML += '<option value="3">Sucursal 3</option><option value="4">Sucursal 4</option>';
        } else if (this.value === '3') {
            sucursalSelect.innerHTML += '<option value="5">Sucursal 5</option><option value="6">Sucursal 6</option>';
        }
    });
    
    // Validación de código único y formato
    codigoInput.addEventListener('blur', function() {
        const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,15}$/;
        if (!regex.test(this.value)) {
            alert("El código del producto debe contener letras y números y tener entre 5 y 15 caracteres.");
            return;
        }
        if (codigosRegistrados.includes(this.value)) {
            alert("El código del producto ya está registrado.");
            this.value = '';
        }
    });
    
    // Validación en el submit
    form.addEventListener('submit', function(event) {
        let valid = true;
        
        // Validación del Nombre
        if (nombreInput.value.trim().length < 2 || nombreInput.value.trim().length > 50) {
            alert("El nombre del producto debe tener entre 2 y 50 caracteres.");
            valid = false;
        }
        
        // Validación del Precio
        const precioRegex = /^\d+(\.\d{1,2})?$/;
        if (!precioRegex.test(precioInput.value) || parseFloat(precioInput.value) <= 0) {
            alert("El precio del producto debe ser un número positivo con hasta dos decimales.");
            valid = false;
        }
        
        // Validación de al menos dos materiales seleccionados
        let checkedCount = 0;
        materialCheckboxes.forEach(checkbox => { if (checkbox.checked) checkedCount++; });
        if (checkedCount < 2) {
            event.preventDefault();
            materialError.style.display = 'block';
            valid = false;
        } else {
            materialError.style.display = 'none';
        }
        
        // Validación de Bodega y Sucursal
        if (bodegaSelect.value === '') {
            alert("Debe seleccionar una bodega.");
            valid = false;
        }
        if (sucursalSelect.value === '') {
            alert("Debe seleccionar una sucursal para la bodega seleccionada.");
            valid = false;
        }
        
        // Validación de Moneda
        if (monedaSelect.value === '') {
            alert("Debe seleccionar una moneda para el producto.");
            valid = false;
        }
        
        // Validación de Descripción
        if (descripcionInput.value.trim().length < 10 || descripcionInput.value.trim().length > 1000) {
            alert("La descripción del producto debe tener entre 10 y 1000 caracteres.");
            valid = false;
        }
        
        if (!valid) {
            event.preventDefault();
        }
    });
});
