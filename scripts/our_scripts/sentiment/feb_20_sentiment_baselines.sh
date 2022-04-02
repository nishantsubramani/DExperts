ALPHA=3.2
EXPERT_SIZE=large
MODEL_DIR=models/experts/sentiment/$EXPERT_SIZE
PROMPTS_DATASET=prompts/sentiment_prompts-10k/neutral_prompts.jsonl
OUTPUT_DIR=generations/sentiment/neutral_prompts/${EXPERT_SIZE}_experts/positive/

NEW_OUTPUT_DIR=$OUTPUT_DIR/dexperts/
python -m scripts.run_sentiment_experiment \
    --use-dataset \
    --dataset-file $PROMPTS_DATASET \
    --model-type dexperts \
    --model gpt2-large \
    --pos-model $MODEL_DIR/finetuned_gpt2_positive \
    --neg-model $MODEL_DIR/finetuned_gpt2_negative \
    --alpha $ALPHA \
    --filter_p 0.9 \
    $NEW_OUTPUT_DIR

NEW_OUTPUT_DIR=$OUTPUT_DIR/dexperts_anti_only/
python -m scripts.run_sentiment_experiment \
    --use-dataset \
    --dataset-file $PROMPTS_DATASET \
    --model-type dexperts \
    --model gpt2-large \
    --neg-model $MODEL_DIR/finetuned_gpt2_negative \
    --alpha $ALPHA \
    --filter_p 0.9 \
    $NEW_OUTPUT_DIR

EXPERT_SIZE=small
MODEL_DIR=models/experts/sentiment/$EXPERT_SIZE
OUTPUT_DIR=generations/sentiment/neutral_prompts/${EXPERT_SIZE}_experts/positive/

NEW_OUTPUT_DIR=$OUTPUT_DIR/dexperts/
python -m scripts.run_sentiment_experiment \
    --use-dataset \
    --dataset-file $PROMPTS_DATASET \
    --model-type dexperts \
    --model gpt2-large \
    --pos-model $MODEL_DIR/finetuned_gpt2_positive \
    --neg-model $MODEL_DIR/finetuned_gpt2_negative \
    --alpha $ALPHA \
    --filter_p 0.9 \
    $NEW_OUTPUT_DIR

NEW_OUTPUT_DIR=$OUTPUT_DIR/dexperts_anti_only/
python -m scripts.run_sentiment_experiment \
    --use-dataset \
    --dataset-file $PROMPTS_DATASET \
    --model-type dexperts \
    --model gpt2-large \
    --neg-model $MODEL_DIR/finetuned_gpt2_negative \
    --alpha $ALPHA \
    --filter_p 0.9 \
    $NEW_OUTPUT_DIR

