$(document).ready(() => {
    const [ STD, CLB, ACT ] = ["Study Event", "Club Event", "Activity Event"];
    const [ study, club, activity ] = [ "#study_event_form",  "#club_event_form", "#activity_event_form" ];
    
    $(document).on("change", "#event_category", () => {
        const eventType = $("#event_category").val();
        
        if(eventType === STD){
            switchViews(study, [club, activity]);
        }else if(eventType === CLB) {
            switchViews(club, [study, activity]);
        }else if(eventType === ACT) {
            switchViews(activity, [study, club]);
        }
    });
    
    function switchViews(showView, hideViews){
        $(showView).addClass("show").removeClass("hide");
        hideViews.forEach( ( view ) => $(view).addClass("hide").removeClass("show"));
    }

})