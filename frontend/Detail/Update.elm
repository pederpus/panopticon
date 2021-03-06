module Detail.Update exposing (update)

import Detail.Model exposing (..)
import Detail.Messages exposing (..)
import Nav.Requests exposing (getDetails)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Update ->
            ( model, Cmd.none )

        GetDetails baseUrl ->
            let
                request =
                    getDetails baseUrl model.environment model.system model.component model.server
            in
                ( model, request )

        Get (Err _) ->
            ( model, Cmd.none )

        Get (Ok metrics) ->
            ( metrics, Cmd.none )
