return {
    _Basename = function(s)
        return string.gsub(s, '(.*[/\\])(.*)', '%2')
    end,

    _Tab_title = function(tab_info)
        local title = tab_info.tab_title

        -- if the tab title is explicitly set, take that
        if title and #title > 0 then
            return title
        end

        -- Otherwise, use the title from the active pane
        return tab_info.active_pane.title  -- in that tab
    end
}
