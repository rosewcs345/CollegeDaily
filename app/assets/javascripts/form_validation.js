$(document).ready(function(){
    const $errElem = $('<span />', {
        text: 'Invalid input',
        class: 'err',
        css: {
            color: 'red',
            padding: '3px'
        }
    });
    
    const [title, host, loc, desc] = ["#event_title", "#event_host", "#event_location", "#event_description"];
    let [ isForm, isTitle, isHost, isLocation, isDesc, isDate, isTime ] = [ false, false, false, false, false, false, false ];
    const [yy, mm, dd ] = ["#event_date_1i", "#event_date_2i", "#event_date_3i"];
    const [st_hr, st_mt, et_hr, et_mt] = ["#event_start_time_4i", "#event_start_time_5i", "#event_end_time_4i", "#event_end_time_5i"];
    
    init();
    
    function init(){
        isTitle = isValidElem($(title));
        isHost = isValidElem($(host));
        isLocation = isValidElem($(loc));
        isDesc = isValidElem($(desc));
        updateDate();
        updateTime();
        isForm = isFormValid();
    }
    
    function updateDate(){
        const [ day, month, year ] = [$(dd), $(mm), $(yy)]; 
        const date = new Date(Number(year.val()), Number(month.val()) - 1, Number(day.val()));
        const today = new Date();
        
        (today > date) ? isDate = false : isDate = true;
            
        isForm = isFormValid();
    }
    
    function updateTime(){
        const [ day, month, year, start_hr, start_mt, end_hr, end_mt ] = [$(dd), $(mm), $(yy), $(st_hr), $(st_mt), $(et_hr), $(et_mt)]; 
        const start = new Date(Number(year.val()), Number(month.val()) - 1, Number(day.val()), Number($(st_hr).val()), Number($(st_mt).val()), 0);
        const end = new Date(Number(year.val()), Number(month.val()) - 1, Number(day.val()), Number($(et_hr).val()), Number($(et_mt).val()), 0);
        
        ( start < end ) ? isTime = true : isTime = false;

        console.log(start);
        console.log(end);
        
        isForm = isFormValid();
    }
    
    function isValidElem($elem){
        if($.trim($elem.val())) return true;
        else return false;
    }        
    
    function showErrors(){
       (isTitle) ? removeErr(title) : showErr(title, "Title is empty");
       (isHost) ? removeErr(host) : showErr(host, "Host is empty");
       (isLocation) ? removeErr(loc) : showErr(loc, "Location is empty");
       (isDesc) ? removeErr(desc) : showErr(desc, "Description is empty");
       (isDate) ? removeErr(dd) : showErr(dd, "Date should be future date");
       (isTime) ? removeErr(et_mt) : showErr(et_mt, "End time should be greater than start time");
    }
    
    function showErr(id, msg){
        const elem = $(id).parent();
        let err = elem.find("span.err");
        
        if(!err.length){
            $err = $errElem.clone();
            $err.text(msg);
            $(id).parent().append($err);
        }
    }
    
    function removeErr(id){
        $(id).parent().find("span.err").remove();
    }
    
    function isFormValid(){
        return isForm = isTitle & isHost & isLocation & isDesc & isDate & isTime;   
               
    }        
    
    //event handlers

    $(document).on('submit', '#new_event', function(e){    
        if(!isForm){
            e.preventDefault();
            showErrors();
        }
    });
    
    $(document).on('blur', title, function(e){
        isTitle = isValidElem($(this));
        isForm = isFormValid();   
    });
    
    $(document).on('blur', host, function(e){
        isHost = isValidElem($(this));
        isForm = isFormValid();   
    });
    $(document).on('blur', loc, function(e){
        isLocation = isValidElem($(this));
        isForm = isFormValid();;   
    });
    $(document).on('blur', desc, function(e){
        isDesc = isValidElem($(this));
        isForm = isFormValid();
    });
    
    $(document).on('blur', dd, function(e){
        updateDate();
    });

    $(document).on('blur', mm, function(e){
        updateDate();
    });

    $(document).on('blur', yy, function(e){
        updateDate();
    });
    
    $(document).on('blur', st_hr, function(e){
        updateTime();
    });

    $(document).on('blur', st_mt, function(e){
        updateTime();
    });

    $(document).on('blur', et_hr, function(e){
        updateTime();
    });

    $(document).on('blur', et_mt, function(e){
        updateTime();
    });
    
});