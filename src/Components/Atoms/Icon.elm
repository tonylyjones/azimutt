module Components.Atoms.Icon exposing (check, cross, doc, documentSearch, github, inbox, link, menu, photograph, sparkles, twitter)

import Css exposing (Style)
import ElmBook.Chapter exposing (chapter, renderComponentList)
import ElmBook.ElmCSS exposing (Chapter)
import Html.Styled exposing (Html)
import Libs.Html.Styled.Attributes exposing (ariaHidden)
import Svg.Styled exposing (path, svg)
import Svg.Styled.Attributes exposing (clipRule, css, d, fill, fillRule, stroke, strokeLinecap, strokeLinejoin, strokeWidth, viewBox)
import Tailwind.Utilities exposing (h_6, w_6)



-- sorted alphabetically


check : List Style -> Html msg
check styles =
    -- Heroicon name: outline/check
    icon styles "M5 13l4 4L19 7"


cross : Html msg
cross =
    -- Heroicon name: outline/x
    icon [] "M6 18L18 6M6 6l12 12"


documentSearch : Html msg
documentSearch =
    icon [] "M10 21h7a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0012.586 3H7a2 2 0 00-2 2v11m0 5l4.879-4.879m0 0a3 3 0 104.243-4.242 3 3 0 00-4.243 4.242z"


github : Html msg
github =
    filledIcon "M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"


inbox : Html msg
inbox =
    icon [] "M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"


link : Html msg
link =
    icon [] "M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"


menu : Html msg
menu =
    -- Heroicon name: outline/menu
    icon [] "M4 6h16M4 12h16M4 18h16"


photograph : Html msg
photograph =
    icon [] "M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"


sparkles : List Style -> Html msg
sparkles styles =
    -- Heroicon name: outline/sparkles
    icon styles "M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"


twitter : Html msg
twitter =
    filledIcon "M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84"


icon : List Style -> String -> Html msg
icon styles draw =
    svg [ css ([ h_6, w_6 ] ++ styles), fill "none", viewBox "0 0 24 24", stroke "currentColor", ariaHidden True ]
        [ path [ strokeLinecap "round", strokeLinejoin "round", strokeWidth "2", d draw ] []
        ]


filledIcon : String -> Html msg
filledIcon draw =
    svg [ css [ h_6, w_6 ], fill "currentColor", viewBox "0 0 24 24", ariaHidden True ]
        [ path [ fillRule "evenodd", clipRule "evenodd", d draw ] []
        ]


doc : Chapter x
doc =
    chapter "Icon"
        |> renderComponentList
            [ ( "check", check [] )
            , ( "cross", cross )
            , ( "documentSearch", documentSearch )
            , ( "github", github )
            , ( "inbox", inbox )
            , ( "link", link )
            , ( "menu", menu )
            , ( "photograph", photograph )
            , ( "sparkles", sparkles [] )
            , ( "twitter", twitter )
            ]
