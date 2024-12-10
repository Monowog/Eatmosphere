import streamlit as st

st.write("""
         # NFL Victor Predictor
         """)

team_list = ['Select Team',
    'bears',
    'bengals',
    'bills',
    'broncos_data',
    'browns_data',
    'buccaneers',
    'cardinals',
    'chargers',
    'chiefs',
    'colts',
    'commanders',
    'cowboys',
    'dolphins',
    'eagles',
    'falcons',
    'giants',
    'jaguars',
    'jets',
    'lions',
    'packers',
    'panthers',
    'patriots',
    'raiders',
    'rams',
    'ravens',
    'saints',
    'seahawks',
    'steelers',
    'texans',
    'titans',
    'vikings',
    '49ers']

home_team = st.selectbox("Home Team", team_list)
away_team = st.selectbox("Away Team", team_list)

#def import_and_predict(image_data, model):

#    prediction = model.predict()

#    return prediction

if st.button("Predict", type="primary"):
    if home_team == away_team:
        st.text("A team can't play against itself!")
    elif (home_team == 'Select Team') or (away_team == 'Select Team'):
        st.text("Please select two different teams to compete")
    else:
        output = "This is a placeholder"
        st.success(output)
    

