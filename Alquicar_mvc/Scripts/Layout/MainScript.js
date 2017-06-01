$(document).ready(function () {
    $(".treview").click(function () {
        $(this).children("ul").slideToggle();
    });

    $("#salirref").click(function () {
        $("#logoutForm").submit();
    });

    $('.cars .mdl-menu__item').click(function () {

        $inputid = $(this).attr("value");
        $p = $("#" + $inputid).attr("value")
        $("#" + $inputid).val($(this).attr("id"));     
    });

    // ----------- script alquicar -------------------------
    function modal() {
        $('.cars .mdl-button').click(function () {
            $id = $($(this)).attr('id');
            $('#modalyes').fadeIn();
            $('#car_id').val($id);
            $('#acceptmdl').click(function () {           
                var cliente = @Session["user_id"].ToString();
                $('#cliente_id').val(cliente);
                $('#alquilarForm').submit()
            });
            $('#canelarmdl').click(function () {
                $('#modalyes').fadeOut();
            });
            console.log($id);       
        });     
       
    }
    function modalaux() {
        
        var dialog = document.querySelector('dialog');
        if (!dialog.showModal) {
            dialogPolyfill.registerDialog(dialog);
        }
        dialog.showModal();
            
        dialog.querySelector('.close').addEventListener('click', function () {
            dialog.close();
        });
    
    }

    function current() {
        var meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
        var diasSemana = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado");
        var f = new Date();
        var month = monthcurrent(f.getMonth());
        var initalDate = f.getFullYear() + "-" + month + "-" + f.getDate();
        $('#start_date').attr({ "value": initalDate, "min": initalDate });
        $('#start_date').click();
        $('#final_date').val(initalDate);
        $('#final_date').click();

    }      
    function monthcurrent(month) {
        if (month > 10) {
            return month+1;
        } else {
            return "0" + (month+1);
        }
    }
    function min_date_return() {
        $('#final_date').click(function () {
            $minimal = $('#start_date').val();
            console.log($minimal);
            $($(this)).attr("min", $minimal);
        });
    }

    var CALENDAR = function () {
        var wrap, label,
                months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

        function init(newWrap) {
            wrap = $(newWrap || "#cal");
            label = wrap.find("#label");
            wrap.find("#prev").bind("click.calendar", function () { switchMonth(false); });
            wrap.find("#next").bind("click.calendar", function () { switchMonth(true); });
            label.bind("click", function () { switchMonth(null, new Date().getMonth(), new Date().getFullYear()); });
            label.click();
        }

        function switchMonth(next, month, year) {
            var curr = label.text().trim().split(" "), calendar, tempYear = parseInt(curr[1], 10);
            month = month || ((next) ? ((curr[0] === "December") ? 0 : months.indexOf(curr[0]) + 1) : ((curr[0] === "January") ? 11 : months.indexOf(curr[0]) - 1));
            year = year || ((next && month === 0) ? tempYear + 1 : (!next && month === 11) ? tempYear - 1 : tempYear);

            if (!month) {
                if (next) {
                    if (curr[0] === "December") {
                        month = 0;
                    } else {
                        month = months.indexOf(curr[0]) + 1;
                    }
                } else {
                    if (curr[0] === "January") {
                        month = 11;
                    } else {
                        month = months.indexOf(curr[0]) - 1;
                    }
                }
            }

            if (!year) {
                if (next && month === 0) {
                    year = tempYear + 1;
                } else if (!next && month === 11) {
                    year = tempYear - 1;
                } else {
                    year = tempYear;
                }
            }

            calendar = createCal(year, month);
            $("#cal-frame", wrap)
                .find(".curr")
                    .removeClass("curr")
                    .addClass("temp")
                .end()
                .prepend(calendar.calendar())
                .find(".temp")
                    .fadeOut("slow", function () { $(this).remove(); });

            $('#label').text(calendar.label);
        }

        function createCal(year, month) {
            var day = 1, i, j, haveDays = true,
            startDay = new Date(year, month, day).getDay(),
            daysInMonths = [31, (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
            calendar = [];

            if (createCal.cache[year]) {
                if (createCal.cache[year][month]) {
                    return createCal.cache[year][month];
                }
            } else {
                createCal.cache[year] = {};
            }

            i = 0;
            while (haveDays) {
                calendar[i] = [];
                for (j = 0; j < 7; j++) {
                    if (i === 0) {
                        if (j === startDay) {
                            calendar[i][j] = day++;
                            startDay++;
                        }
                    } else if (day <= daysInMonths[month]) {
                        calendar[i][j] = day++;
                    } else {
                        calendar[i][j] = "";
                        haveDays = false;
                    }
                    if (day > daysInMonths[month]) {
                        haveDays = false;
                    }
                }
                i++;
            }

            if (calendar[5]) {
                for (i = 0; i < calendar[5].length; i++) {
                    if (calendar[5][i] !== "") {
                        calendar[4][i] = "<span>" + calendar[4][i] + "</span><span>" + calendar[5][i] + "</span>";
                    }
                }
                calendar = calendar.slice(0, 5);
            }

            for (i = 0; i < calendar.length; i++) {
                calendar[i] = "<tr><td>" + calendar[i].join("</td><td>") + "</td></tr>";
            }
            calendar = $("<table>" + calendar.join("") + "</table>").addClass("curr");

            $("td:empty", calendar).addClass("nil");
            if (month === new Date().getMonth()) {
                $('td', calendar).filter(function () { return $(this).text() === new Date().getDate().toString(); }).addClass("today");
            }
            createCal.cache[year][month] = { calendar: function () { return calendar.clone() }, label: months[month] + " " + year };

            return createCal.cache[year][month];
        }
        createCal.cache = {};
        return {
            init: init,
            switchMonth: switchMonth,
            createCal: createCal
        };
    };
    

    //$(".register_check").click(function () {
    //    var per = "";
    //    $("input:checkbox:checked").each(function () {
    //        per += $(this).attr("id") + ",";
    //        console.log(per);
    //    });

    //    $('#Permissions').val(per);
    //    $('#UserForm').submit();
    //});
});