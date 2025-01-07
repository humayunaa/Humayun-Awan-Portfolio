import numpy as np

def voting_ensemble(data, vectorizer, models):

    data_features = vectorizer.transform(data).toarray()

    predictions = [model.predict(data_features) for model in models.values()]

    pred_ve = np.vstack(predictions).T
    voting_ensemble_y_pred = np.array([np.bincount(row).argmax() for row in pred_ve])

    return voting_ensemble_y_pred