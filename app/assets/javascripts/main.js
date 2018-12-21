$(document).ready(() => {
    const [ STD, CLB, OUT ] = ["Study Event", "Club Event", "Outdoor Event"];
    const [ study, club, outdoor ] = [ "#study_event_form",  "#club_event_form", "#outdoor_event_form" ];
    
    $(document).on("change", "#event_category", () => {
        const eventType = $("#event_category").val();
        
        if(eventType === STD){
            switchViews(study, [club, outdoor]);
        }else if(eventType === CLB) {
            switchViews(club, [study, outdoor]);
        }else if(eventType === OUT) {
            switchViews(outdoor, [study, club]);
        }
    });
    
    function switchViews(showView, hideViews){
        $(showView).addClass("show").removeClass("hide");
        hideViews.forEach( ( view ) => $(view).addClass("hide").removeClass("show"));
    }

})