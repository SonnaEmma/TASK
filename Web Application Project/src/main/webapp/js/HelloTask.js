// Funktion zum Anzeigen des Tooltips
    function showTooltip(event, text) {
        const tooltip = document.getElementById("tooltip");
        tooltip.style.display = "block";
        tooltip.innerHTML = text;
        
        // Positioniere den Tooltip an der Mausposition
        tooltip.style.left = event.pageX + 15 + "px";
        tooltip.style.top = event.pageY + 15 + "px";
    }

    // Funktion zum Verstecken des Tooltips
    function hideTooltip() {
        const tooltip = document.getElementById("tooltip");
        tooltip.style.display = "none";
    }

    // Mausbewegungen verfolgen und Tooltip positionieren
    document.onmousemove = function(event) {
        const tooltip = document.getElementById("tooltip");
        if (tooltip.style.display === "block") {
            tooltip.style.left = event.pageX + 15 + "px";
            tooltip.style.top = event.pageY + 15 + "px";
        }
    };
    