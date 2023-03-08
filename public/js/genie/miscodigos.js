function aumentarSize()
{
a = ejemplo9.n.value.toString().length;
console.log(document.querySelectorAll(".entrada"))
console.log(a)
    if (a > 1) { ejemplo9.n.style.width =`${a+5}ch`; }
    if (a < 1) { ejemplo9.n.style.width = "5ch"; }

}


function aumentarSize2()
{
b = ejemplo90.x1.value.toString().length;
console.log(document.querySelectorAll(".entrada"))
console.log(b)
    if (b > 1) { ejemplo90.x1.style.width =`${b+5}ch`; }
    if (b < 1) { ejemplo90.x1.style.width = "5ch"; }
}

function pxy_txy(form)
{
a = form.tipo.options;
sal1 = form.unidadT.options;
sal2 = form.usalida.options;

console.log(a)
    if (a[0].selected == true)
    {
    sal1.length = null
    sal2.length = null
    sal1[0] = new Option("K","K")
    sal1[1] = new Option("°C","°C")
    sal1[2] = new Option("Ra","Ra")
    sal1[3] = new Option("°F","°F")
    sal2[0] = new Option("atm","atm")
    sal2[1] = new Option("Torr","Torr")
    sal2[2] = new Option("Pa","Pa")
    sal2[3] = new Option("kPa","kPa")
    sal2[4] = new Option("psi","psi")
    sal2[5] = new Option("bar","bar")
    }
    if (a[1].selected == true)
    {
    sal1.length = null
    sal2.length = null
    sal2[0] = new Option("K","K")
    sal2[1] = new Option("°C","°C")
    sal2[2] = new Option("Ra","Ra")
    sal2[3] = new Option("°F","°F")
    sal1[0] = new Option("atm","atm")
    sal1[1] = new Option("Torr","Torr")
    sal1[2] = new Option("Pa","Pa")
    sal1[3] = new Option("kPa","kPa")
    sal1[4] = new Option("psi","psi")
    sal1[5] = new Option("bar","bar")
    }

}


    $(document).ready(function(){
      var url = "{{ route('task') }}";
      var i=1;

      $('#add').click(function(){
        var task = $("#task").val();
        i++;
        $('#dynamic_field').append('<tr id="row'+i+'" class="dynamic-added"><td><input type="text" name="name'+i+'" placeholder="Enter task" class="form-control name_list" value="'+task+'" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');
      });

      $(document).on('click', '.btn_remove', function(){
           var button_id = $(this).attr("id");
           $('#row'+button_id+'').remove();
      });

      $.ajaxSetup({
          headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
      });

      $('#submit').click(function(){
           $.ajax({
                url:url,
                method:"POST",
                data:$('#add_name').serialize(),
                type:'json',
                success:function(data)
                {
                    if(data.error){
                        error_message_showing(data.error);
                    }else{
                        i=1;
                        $('.dynamic-added').remove();
                        $('#add_name')[0].reset();
                        $(".print-success-msg").find("ul").html('');
                        $(".print-success-msg").css('display','block');
                        $(".print-error-msg").css('display','none');
                        $(".print-success-msg").find("ul").append('<li>Record Inserted Successfully.</li>');
                  }
              }
        });
    });


    });



var i = 2;
var n = jQuery("[name=n]").val();
var j;

$("#botonverde").click(function() {
 $(".mastabla:first").append("<th class='top-tabla-rojo dt"+ i +"'>      <select class='buscador' id='buscador"+ i +"' placeholder='Grupo...' name='grup"+i+"'>         <option value=''>Grupo...</option>         <option value='CH3'>CH<sub>3</sub></option>         <option value='CH2'>CH<sub>2</sub></option>         <option value='CH'>CH</option>         <option value='C'>C</option>         <option value='CH2=CH'>CH<sub>2</sub>=CH</option>         <option value='CH=CH'>CH=CH</option>         <option value='CH2=C'>CH<sub>2</sub>=C</option>         <option value='CH=C'>CH=C</option>         <option value='ACH'>ACH</option>         <option value='AC'>AC</option>         <option value='ACCH3'>ACCH<sub>3</sub></option>         <option value='ACCH2'>ACCH<sub>2</sub></option>         <option value='ACCH'>ACCH</option>         <option value='OH'>OH</option>         <option value='CH3OH'>CH<sub>3</sub>OH</option>          <option value='H2O'>H<sub>2</sub>O</option>          <option value='ACOH'>ACOH</option>          <option value='CH3CO'>CH<sub>3</sub>CO</option>          <option value='CH2CO'>CH<sub>2</sub>CO</option>          <option value='CHO'>CHO</option>          <option value='CH3COO'>CH<sub>3</sub>COO</option>          <option value='CH2COO'>CH<sub>2</sub>COO</option>          <option value='HCOO'>HCOO</option>          <option value='CH3O'>CH<sub>3</sub>O</option>          <option value='CH2O'>CH<sub>2</sub>O</option>          <option value='CHO'>CHO</option>          <option value='THF'>THF</option>          <option value='CH3NH2'>CH<sub>3</sub>NH<sub>2</sub></option>          <option value='CH2NH2'>CH<sub>2</sub>NH<sub>2</sub></option>          <option value='CHNH2'>CHNH<sub>2</sub></option>          <option value='CH3NH'>CH<sub>3</sub>NH</option>          <option value='CH2NH'>CH<sub>2</sub>NH</option>          <option value='CHNH'>CHNH</option>          <option value='CH3N'>CH<sub>3</sub>N</option>          <option value='CH2N'>CH<sub>2</sub>N</option>          <option value='ACNH2'>ACNH<sub>2</sub></option>          <option value='C5H5N'>C5H5N</option>          <option value='C5H4N'>C5H4N</option>          <option value='C5H3N'>C5H3N</option>          <option value='CH3CN'>CH3CN</option>          <option value='CH2CN'>CH2CN</option>          <option value='COOH'>COOH</option>          <option value='HCOOH'>HCOOH</option>          <option value='CH2CL'>CH2CL</option>          <option value='CHCL'>CHCL</option>          <option value='CCL'>CCL</option>          <option value='CH2CL2'>CH2CL2</option>          <option value='CHCL2'>CHCL2</option>          <option value='CCL2'>CCL2</option>          <option value='CHCL3'>CHCL3</option>          <option value='CCL3'>CCL3</option>          <option value='CCL4'>CCL4</option>          <option value='ACCL'>ACCL</option>          <option value='CH3NO2'>CH3NO2</option>          <option value='CH2NO2'>CH2NO2</option>          <option value='CHNO2'>CHNO2</option>          <option value='ACNO2'>ACNO2</option>          <option value='CS2'>CS2</option>          <option value='CH3SH'>CH3SH</option>          <option value='CH2SH'>CH2SH</option>          <option value='FURFURAL'>FURFURAL</option>          <option value='DOH'>DOH</option>          <option value='I'>I</option>          <option value='BR'>BR</option>          <option value='CH≡C'>CH≡C</option>          <option value='C≡C'>C≡C</option>          <option value='DMSO'>DMSO</option>          <option value='ACRY'>ACRY</option>          <option value='CL-(C=C)'>CL-(C=C)</option>          <option value='C=C'>C=C</option>          <option value='ACF'>ACF</option>          <option value='DMF'>DMF</option>          <option value='HCON(..'>HCON(..</option>          <option value='CF3'>CF3</option>          <option value='CF2'>CF2</option>          <option value='CF'>CF</option>          <option value='COO'>COO</option>          <option value='SIH3'>SIH3</option>          <option value='SIH2'>SIH2</option>          <option value='SIH'>SIH</option>          <option value='SI'>SI</option>          <option value='SIH2O'>SIH2O</option>          <option value='SIHO'>SIHO</option>          <option value='SIO'>SIO</option>          <option value='NMP'>NMP</option>          <option value='CCL3F'>CCL3F</option>          <option value='CCL2F'>CCL2F</option>          <option value='HCCL2F'>HCCL2F</option>          <option value='HCCLF'>HCCLF</option>          <option value='CCLF2'>CCLF2</option>          <option value='HCCLF2'>HCCLF2</option>          <option value='CCLF3'>CCLF3</option>          <option value='CCL2F2'>CCL2F2</option>          <option value='AMH2'>AMH2</option>          <option value='AMHCH3'>AMHCH3</option>          <option value='AMHCH2'>AMHCH2</option>          <option value='AM(CH3)2'>AM(CH3)2</option>          <option value='AMCH3CH2'>AMCH3CH2</option>          <option value='AM(CH2)2'>AM(CH2)2</option>          <option value='C2H5O2'>C2H5O2</option>          <option value='C2H4O2'>C2H4O2</option>          <option value='CH3S'>CH3S</option>          <option value='CH2S'>CH2S</option>          <option value='CHS'>CHS</option>          <option value='MORPH'>MORPH</option>          <option value='C4H4S'>C4H4S</option>          <option value='C4H3S'>C4H3S</option>          <option value='C4H2S'>C4H2S</option>          <option value='NCO'>NCO</option>          <option value='(CH2)2SU'>(CH2)2SU</option>          <option value='CH2CHSU'>CH2CHSU</option>          <option value='IMIDAZOL'>IMIDAZOL</option>          <option value='BTI'>BTI</option>       </select> </th>");
$('input[name=ng]').val(i);
$(document).ready(function () {
      $('select.buscador').selectize({
          sortField: 'text'
      });
  });


 for (j = 1; j <= n; j++) {
  $(".mastabla"+ j +"").append("<td class='dt"+ i +"'><input type='number' required='required' name='fre"+ j +","+i+"' value='0' step='1' class='entrada'></td>");
}
 i = i + 1;
});

$("#botonrojo").click(function() {
if(i<=2){
i = 2
}else{
i = i - 1;
 $(".dt" + i).remove();
}
$('input[name=ng]').val(i-1);
});

  $(document).ready(function () {
      $('select.buscador').selectize({
          sortField: 'text'
      });
  });


  function hidrocarburos(className,cn2) {
    var items = document.getElementsByClassName(className);
    var items2 = document.getElementsByClassName(cn2);
    for (var i=0; i < items.length; i++) {
      items[i].disabled=document.getElementById("hidrocheck").checked;
      
    }
    for (var j=0; j < items2.length; j++) {
      items2[j].checked=document.getElementById("hidrocheck").checked;
      console.log(document.getElementById("hidrocheck").checked)
      
    }
  }

  function hidrocarburos_ind(n1,n2,n3,id) {
    var n11 = document.getElementsByName(n1);
    var n22 = document.getElementsByName(n2);
    var n33 = document.getElementsByName(n3);
    n11[0].disabled=document.getElementById(id).checked;
    n22[0].disabled=document.getElementById(id).checked;
    n33[0].disabled=document.getElementById(id).checked;
  }