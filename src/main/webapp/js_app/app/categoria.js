$(document).ready(function () {

  $('#btnAbrirNCategoria').click(function () {
    $('#txtIdCategoriaER').val("");
    $('#txtNombreCategoriaER').val("");
    $('.error-validation').fadeOut();
    $('#actionCategoria').val("addCategoria");
    $('#tituloModalManCategoria').html("REGISTRAR CATEGORIA");
    $('#ventanaModalManCategoria').modal('show');
  });

  $('#FrmCategoria').submit(function () {
    $('#actionCategoria').val("paginarCategoria");
    $('#nameFormCategoria').val("FrmCategoria");
    $('#numberPageCategoryia').val("1");
    $('#modalCargandoCategoria').modal('show');
    return false;
  });

  $('#FrmCategoriaModal').submit(function () {
    if (validarFormularioCategoria()) {
      $('#nameFormCategoria').val("FrmCategoriaModal");
      $('#modalCargandoCategoria').modal('show');
    }
    return false;
  });

  $("#modalCargandoCategoria").on('shown.bs.modal', function () {
    processAjaxCategoria();
  });

//  $("#ventanaModalManCategoria").on('hidden.bs.modal', function () {
//    $("#actionCategoria").val("paginarCategoria");
//  });

  addEventoCombosPaginar();
  addValicacionesCamposCategoria();
  $('#modalCargandoCategoria').modal('show');

});

function processAjaxCategoria() {
  var datosSerializadosCompletos = $('#' + $('#nameFormCategoria').val()).serialize();
  if ($('#nameFormCategoria').val().toLowerCase() !== "frmcategoria") {
    datosSerializadosCompletos += "&txtNombreCategoria=" + $('#txtNombreCategoria').val();
  }
  datosSerializadosCompletos += "&numberPageCategoria=" + $('#numberPageCategoria').val();
  datosSerializadosCompletos += "&sizePageCategoria=" + $('#sizePageCategoria').val();
  datosSerializadosCompletos += "&action=" + $('#actionCategoria').val();

  $.ajax({
    url: 'categorias',
    type: 'POST',
    data: datosSerializadosCompletos,
    dataType: 'json',
    success: function (jsonResponse) {
      $('#modalCargandoCategoria').modal("hide");

      if ($('#actionCategoria').val().toLowerCase() === "paginarcategoria") {
        listarCategoria(jsonResponse.BEAN_PAGINATION);
      } else {
        if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
          $("#ventanaModalManCategoria").modal("hide");
          viewAlert('success', 'Operacion realizada con exito');
          listarCategoria(jsonResponse.BEAN_PAGINATION);
        } else {
          viewAlert('warning', jsonResponse.MESSAGE_SERVER);
        }
      }
      console.log(jsonResponse);
//      $("#ventanaModalManCategoria").modal("hide");

//      listarCategoria(jsonResponse.BEAN_PAGINATION);
    },
    error: function (errorThrown) {
      $('#modalCargandoCategoria').modal("hide");
      console.log("Error de llamada ajax " + errorThrown);
      viewAlert('error','Error interno en el servidor');
    }
  });
  return false;
}

function listarCategoria(BEAN_PAGINATION) {
  /*PAGINATION*/
  var $pagination = $('#paginationCategoria');
  $('#tbodyCategoria').empty();
  $pagination.twbsPagination('destroy');
  $('#nameCrudCategorias').html("[" + BEAN_PAGINATION.COUNT_FILTER + "] CATEGORIAS");

  if (BEAN_PAGINATION.COUNT_FILTER > 0) {
    var fila;
    var atributos;
    $.each(BEAN_PAGINATION.LIST, function (index, value) {
      fila = "<tr ";
      atributos = "";
      atributos += "idcategoria='" + value.idcategoria + "' ";
      atributos += "nombre='" + value.nombre + "' ";
      fila += atributos;
      fila += ">";
      fila += "<td class='align-middle'>" + value.idcategoria + "</td>";
      fila += "<td class='align-middle'>" + value.nombre + "</td>";
      fila += "<td class='text-center align-middle'>\n\
              <button class='btn btn-warning btn-xs editar-Categoria'><i class='fa fa-edit'></i></button>\n\
              <button class='btn btn-danger btn-xs eliminar-Categoria'><i class='fa fa-trash'></i></button></td>";
      fila += "</tr>";
      $('#tbodyCategoria').append(fila);
    });
    //AGREGANDO LOS BOTONES DE LA PAGINACION
    var defaultOptions = getDefaultoptionPagination();

    var totalPages = BEAN_PAGINATION.COUNT_FILTER / parseInt($('#sizePageCategoria').val()) + 1;

    var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageCategoria'),
            $('#numberPageCategoria'), $('#actionCategoria'), 'paginarCategoria',
            $('#nameForm'), 'FrmCategoria', $('#modalCargandoCategoria'));
    $pagination.twbsPagination('destroy');
    $pagination.twbsPagination($.extend({}, defaultOptions, options));
    $('#txtNombreCategoria').focus();
    addEventosCategoria();
  } else {
    $pagination.twbsPagination('destroy');
    viewAlert('warning', 'No se enconntraron resultados');

  }
}

function addEventosCategoria() {
  //Editar
  $('.editar-Categoria').each(function () {
    $(this).click(function () {
      $('#txtIdCategoriaER').val($(this.parentElement.parentElement).attr('idcategoria'));
      $('#txtNombreCategoriaER').val($(this.parentElement.parentElement).attr('nombre'));
      $('#actionCategoria').val("updateCategoria");
      $('#tituloModalManCategoria').html("EDITAR CATEGORIA");
      $('#ventanaModalManCategoria').modal("show");
      document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });
  });
  //Eliminar
  $('.eliminar-Categoria').each(function () {
    $(this).click(function () {
      $('#txtIdCategoriaER').val($(this.parentElement.parentElement).attr('idcategoria'));
      viewAlertDelete("Categoria");
      document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });
  });
}

function addValicacionesCamposCategoria() {
  $('#txtNombreCategoriaER').on('change', function () {
    $(this).val() === "" ? $("#validarNombreCategoriaER").fadeIn("slow") : $("#validarNombreCategoriaER").fadeOut();
  });
}

function validarFormularioCategoria() {
  if ($('#txtNombreCategoriaER').val() === "") {
    $("#validarNombreCategoriaER").fadeIn("slow");
    return false;
  } else {
    $("#validarNombreCategoriaER").fadeOut();
  }
  return true;
}